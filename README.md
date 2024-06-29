# Recon Script

This script performs reconnaissance on a specified domain by enumerating subdomains, checking for alive subdomains, crawling for endpoints, and finding sensitive files, JavaScript files, potential XSS points, admin login pages, and more. 

## Requirements

Ensure the following tools are installed and accessible in your PATH:
- `figlet`
- `subfinder`
- `curl`
- `jq`
- `findomain`
- `httpx-toolkit`
- `katana`
- `waybackurls`
- `shodanx`
- `dirsearch`

## Usage

1. Clone the repository or download the script file.
2. Make the script executable:
   ```bash
   chmod +x recon.sh
3. Run the script:
   ```bash
   ./recon.sh

Script Workflow

# ASCII Art Banner: Displays a banner using figlet.
# User Greeting: Greets the user.
# Domain Input: Prompts the user to enter a domain.
# Directory Setup: Creates and navigates into a directory named after the domain.
# Subdomain Enumeration:
# Uses subfinder, crt.sh, and findomain to enumerate subdomains.
# Combines and deduplicates the subdomains.
# Alive Subdomains Check: Uses httpx-toolkit to check which subdomains are alive.
# Crawling for Endpoints:
# Uses katana and waybackurls to find URLs and endpoints.
# Filters for sensitive files, JavaScript files, potential XSS points, and admin login pages.
# IP Gathering: Uses shodanx to gather IP information.
# Fuzzing: Uses dirsearch to fuzz for common file types on the main domain.
# Results: Saves all recon results in the specified domain's directory.
