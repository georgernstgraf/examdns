#!/usr/local/bin/python3
import subprocess
import re

def get_active_ips(subnet_prefix="192.168.21."):
    try:
        # Execute pfctl -ss and capture output
        # Requires root privileges to run pfctl
        result = subprocess.run(
            ["pfctl", "-ss"], 
            capture_output=True, 
            text=True, 
            check=True
        )

        # Regex explanation:
        # Look for the literal prefix, then one to three digits (\d+)
        # It automatically stops at the ':' (port separator) or whitespace
        pattern = rf"{re.escape(subnet_prefix)}\d+"
        
        # Find all matches and use a set to ensure uniqueness
        found_ips = set(re.findall(pattern, result.stdout))

        # Sort numerically by the last octet for a clean list
        sorted_ips = sorted(found_ips, key=lambda ip: int(ip.split(".")[-1]))

        for ip in sorted_ips:
            print(ip)

    except subprocess.CalledProcessError as e:
        print(f"Error: Could not execute pfctl. {e}")
    except PermissionError:
        print("Error: Permission denied. Please run as root/sudo.")

if __name__ == "__main__":
    get_active_ips()
