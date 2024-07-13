Here's a `README.md` file 

```markdown
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
   chmod +x aoda_recon.sh
   ```
3. Run the script:
   ```bash
   ./aoda_recon.sh
   ```

## Script Workflow

1. **ASCII Art Banner**: Displays a banner using `figlet`.
2. **User Greeting**: Greets the user.
3. **Domain Input**: Prompts the user to enter a domain.
4. **Directory Setup**: Creates and navigates into a directory named after the domain.
5. **Subdomain Enumeration**:
   - Uses `subfinder`, `crt.sh`, and `findomain` to enumerate subdomains.
   - Combines and deduplicates the subdomains.
6. **Alive Subdomains Check**: Uses `httpx-toolkit` to check which subdomains are alive.
7. **Crawling for Endpoints**:
   - Uses `katana` and `waybackurls` to find URLs and endpoints.
   - Filters for sensitive files, JavaScript files, potential XSS points, and admin login pages.
8. **IP Gathering**: Uses `shodanx` to gather IP information.
9. **Fuzzing**: Uses `dirsearch` to fuzz for common file types on the main domain.
10. **Results**: Saves all recon results in the specified domain's directory.

## Detailed Steps

1. **Subdomain Enumeration**:
   - Subdomains are gathered using `subfinder`, `crt.sh`, and `findomain`.
   - All subdomains are combined into a single file.
   
2. **Subdomain of Subdomain Enumeration**:
   - Further enumeration is performed on the gathered subdomains using `subfinder`.

3. **Checking for Alive Subdomains**:
   - Alive subdomains are checked using `httpx-toolkit` and saved.

4. **Crawling for Endpoints**:
   - Endpoints are gathered using `katana` and `waybackurls`.
   - Filters for sensitive file types, JavaScript files, and potential XSS points.

5. **Finding Admin Logins**:
   - Admin login pages are found using `httpx-toolkit`.

6. **IP Gathering**:
   - Shodan is used to gather IP information related to the domain.

7. **Fuzzing**:
   - Fuzzing is performed on the main domain using `dirsearch`.

## Output

The script saves the results in the domain directory with the following files:
- `subdomains`: All found subdomains.
- `subdomains_alive`: Alive subdomains.
- `allurls`: All crawled URLs and endpoints.
- `sensitiveurls`: Filtered sensitive URLs.
- `js`: JavaScript files.
- `xss`: Potential XSS points.
- `adminlogins`: Admin login pages.

## Cleanup

The script removes intermediate files created during the process to keep the directory clean.

## Notes

- Ensure you have appropriate permissions to run network scans and crawls against the target domain.
- Use responsibly and in compliance with the target's terms of service.








