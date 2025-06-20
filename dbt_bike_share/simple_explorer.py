import duckdb

# Connect to the DuckDB database
conn = duckdb.connect('bike_share.db')

def print_separator():
    print("-" * 80)

def format_table(rows, headers):
    """Simple function to format rows into a tabular output"""
    if not rows:
        return "No data found"
    
    # Calculate column widths
    col_widths = [len(str(h)) for h in headers]
    for row in rows:
        for i, cell in enumerate(row):
            col_widths[i] = max(col_widths[i], len(str(cell)))
    
    # Format header
    header = " | ".join(f"{h:{w}s}" for h, w in zip(headers, col_widths))
    separator = "-+-".join("-" * w for w in col_widths)
    
    # Format rows
    formatted_rows = []
    for row in rows:
        formatted_row = " | ".join(f"{str(cell):{w}s}" for cell, w in zip(row, col_widths))
        formatted_rows.append(formatted_row)
    
    # Combine everything
    return f"{header}\n{separator}\n" + "\n".join(formatted_rows)

def list_tables():
    """List all tables in the database"""
    print_separator()
    print("AVAILABLE TABLES:")
    print_separator()
    
    tables = conn.execute("SELECT table_name FROM information_schema.tables WHERE table_schema='main'").fetchall()
    for i, (table,) in enumerate(tables, 1):
        print(f"{i}. {table}")
    
    return [t[0] for t in tables]

def table_info(table_name):
    """Show information about a table"""
    # Get column information
    columns = conn.execute(f"PRAGMA table_info('{table_name}')").fetchall()
    
    print_separator()
    print(f"COLUMNS IN {table_name.upper()}:")
    print_separator()
    
    for col in columns:
        col_name, col_type = col[1], col[2]
        print(f"- {col_name} ({col_type})")
    
    # Get row count
    count = conn.execute(f"SELECT COUNT(*) FROM {table_name}").fetchone()[0]
    print_separator()
    print(f"Total rows: {count:,}")

def show_data(table_name, limit=10):
    """Show sample data from a table"""
    query = f"SELECT * FROM {table_name} LIMIT {limit}"
    result = conn.execute(query).fetchall()
    
    if not result:
        print("No data found in this table.")
        return
    
    # Get column names
    columns = conn.execute(f"PRAGMA table_info('{table_name}')").fetchall()
    headers = [col[1] for col in columns]
    
    print_separator()
    print(f"SAMPLE DATA FROM {table_name.upper()} (FIRST {limit} ROWS):")
    print_separator()
    
    print(format_table(result, headers))

def run_query(query):
    """Run a custom SQL query"""
    try:
        result = conn.execute(query).fetchall()
        
        if not result:
            print("Query executed successfully but returned no rows.")
            return True
        
        # Get column names from the result
        headers = [desc[0] for desc in conn.description]
        
        print_separator()
        print("QUERY RESULTS:")
        print_separator()
        
        print(format_table(result, headers))
        print(f"\nRows returned: {len(result):,}")
        return True
    
    except Exception as e:
        print(f"Error executing query: {e}")
        return False

def main_menu():
    """Main menu for the data explorer"""
    while True:
        print("\n" + "=" * 40)
        print("BIKE SHARE DATA EXPLORER".center(40))
        print("=" * 40)
        print("1. List all tables")
        print("2. Explore a table")
        print("3. Run a custom query")
        print("4. Run a sample query")
        print("5. Exit")
        
        choice = input("\nEnter your choice (1-5): ")
        
        if choice == "1":
            list_tables()
        
        elif choice == "2":
            tables = list_tables()
            if not tables:
                print("No tables found in the database.")
                continue
                
            table_input = input("\nEnter table number to explore: ")
            try:
                table_idx = int(table_input) - 1
                if 0 <= table_idx < len(tables):
                    table_name = tables[table_idx]
                    table_info(table_name)
                    
                    limit_input = input("\nHow many rows to display? (default: 10): ").strip()
                    limit = int(limit_input) if limit_input else 10
                    show_data(table_name, limit)
                else:
                    print("Invalid table number")
            except ValueError:
                print("Please enter a valid number")
        
        elif choice == "3":
            query = input("\nEnter your SQL query: ")
            run_query(query)
        
        elif choice == "4":
            print("\n--- Sample Queries ---")
            print("1. Top 10 busiest routes by ride count")
            print("2. Average trip duration by day of week")
            print("3. Rides by user type")
            print("4. Busiest stations")
            print("5. Trips by time of day")
            print("6. Gender standardization check")
            
            query_choice = input("\nSelect a sample query (1-5): ")
            
            if query_choice == "1":
                query = """
                SELECT 
                    start_station_id, 
                    end_station_id, 
                    SUM(ride_count) as total_rides,
                    AVG(avg_trip_duration_min) as avg_duration
                FROM main.fact_rides_summary
                GROUP BY start_station_id, end_station_id
                ORDER BY total_rides DESC
                LIMIT 10
                """
                run_query(query)
            
            elif query_choice == "2":
                query = """
                SELECT 
                    day_of_week,
                    AVG(avg_trip_duration_min) as avg_duration
                FROM main.fact_rides_summary
                GROUP BY day_of_week
                ORDER BY day_of_week
                """
                run_query(query)
            
            elif query_choice == "3":
                query = """
                SELECT 
                    u.user_type,
                    SUM(f.ride_count) as total_rides
                FROM main.fact_rides_summary f
                JOIN main.dim_users u ON f.user_key = u.user_key
                GROUP BY u.user_type
                ORDER BY total_rides DESC
                """
                run_query(query)
            
            elif query_choice == "4":
                query = """
                SELECT 
                    station_id,
                    station_name,
                    total_traffic
                FROM main.dim_stations
                ORDER BY total_traffic DESC
                LIMIT 15
                """
                run_query(query)
            
            elif query_choice == "5":
                query = """
                SELECT 
                    time_of_day,
                    SUM(ride_count) as total_rides
                FROM main.fact_rides_summary
                GROUP BY time_of_day
                ORDER BY total_rides DESC
                """
                run_query(query)

            elif query_choice == "6":
                print("\nChecking gender standardization across all models...")
                # First, check stg_users
                query_stg_users = "SELECT DISTINCT gender FROM stg_users ORDER BY gender"
                print("\nGender values in stg_users:")
                run_query(query_stg_users)
                
                # Check int_rides_enriched
                query_int_rides = "SELECT DISTINCT gender FROM int_rides_enriched ORDER BY gender"
                print("\nGender values in int_rides_enriched:")
                run_query(query_int_rides)
                
                # Check dim_users
                query_dim_users = "SELECT DISTINCT gender FROM dim_users ORDER BY gender"
                print("\nGender values in dim_users:")
                run_query(query_dim_users)
                
                # Check gender distribution in fact_rides_summary
                query_fact = """
                SELECT 
                    u.gender, 
                    COUNT(*) as count,
                    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM fact_rides_summary), 2) as percentage
                FROM fact_rides_summary f
                JOIN dim_users u ON f.user_key = u.user_key
                GROUP BY u.gender
                ORDER BY count DESC
                """
                print("\nGender distribution in fact_rides_summary:")
                run_query(query_fact)
            
            else:
                print("Invalid choice")
        
        elif choice == "5":
            print("\nExiting the Data Explorer. Goodbye!")
            break
        
        else:
            print("Invalid choice. Please enter a number between 1 and 5.")

if __name__ == "__main__":
    print("Welcome to the Bike Share Data Explorer!")
    print("This tool will help you explore the transformed data in your dbt project.")
    
    try:
        main_menu()
    except KeyboardInterrupt:
        print("\n\nExiting due to user interrupt.")
    finally:
        # Close the connection when done
        conn.close()
        print("Database connection closed.")

