# 🛡️ Subdomain Security Audit (Anonymized OSINT Project)

## 🔍 Objective
This project demonstrates how I performed a subdomain and DNS exposure audit on a Cloudflare-protected domain using Open Source Intelligence (OSINT) techniques. The goal was to detect exposed origin IPs or stale/inactive DNS entries that could increase the attack surface.

> ⚠️ All company-specific details have been anonymized for confidentiality.  
> This project is based on internal experience conducted with authorization.

---

## 🧰 Tools & Techniques Used

- **crt.sh** – Certificate Transparency search for subdomain enumeration
- **dig / host** – DNS resolution and IP lookup
- **Bash scripting** – Automation of subdomain checks
- **Cloudflare IP range checks** – For verifying protection
- **Terminal / VS Code** – Script execution and documentation

---

## 🧪 Methodology

### 1. Subdomain Enumeration
Used `crt.sh` to extract all subdomains associated with `example-company.com` from public SSL/TLS certificates.

### 2. DNS Resolution
Created a Bash script to:
- Loop through all discovered subdomains
- Resolve each one to its corresponding IP address (if any)
- Identify whether the IP is a known Cloudflare IP

### 3. Exposure Check
Compared resolved IPs with Cloudflare’s public IP ranges to detect:
- ✅ Cloudflare-protected subdomains
- ❌ Any that resolve to non-Cloudflare IPs (potentially exposed origin)
- ❓ Subdomains that do not resolve (potentially inactive or deprecated)

---

## 📁 Project Structure

