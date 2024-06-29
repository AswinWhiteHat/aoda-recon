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
   ```bash
   git clone https://github.com/AswinWhiteHat/aoda-recon
3. Make the script executable:
   ```bash
   chmod +x recon.sh
4. Run the script:
   ```bash
   ./recon.sh



Script Workflow
1.Setup:

Display ASCII art banner.
Greet user.
Prompt for domain and create a directory.

2.Subdomain Enumeration:

Use subfinder, crt.sh, and findomain.
Combine and deduplicate subdomains.

3.Alive Subdomains Check:

Check alive subdomains using httpx-toolkit.

4.Crawling for Endpoints:

Gather endpoints with katana and waybackurls.
Filter for sensitive files, JavaScript files, and potential XSS points.

5.Finding Admin Logins:

Identify admin login pages with httpx-toolkit.

6.IP Gathering:

Collect IP information using shodanx.

7.Fuzzing:

Perform fuzzing on the main domain using dirsearch.

8.Results:

Save recon results in the domain directory.
Clean up intermediate files.






