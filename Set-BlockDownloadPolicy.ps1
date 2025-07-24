# --- Step 1: Install SharePoint Online Management Shell (if not already installed) ---
# If you haven't installed it, uncomment and run the following line:
# Install-Module -Name Microsoft.Online.SharePoint.PowerShell -Force

# --- Step 2: Connect to SharePoint Online ---
# You will be prompted to enter your Microsoft 365 administrator credentials.
Connect-SPOService -Url "https://armh-admin.sharepoint.com"

# --- Step 3: Define the Site URL ---
# Replace <yourtenant> with your actual tenant name.
$siteUrl = "https://<yourtenant>.sharepoint.com/sites/GEC25"
# Example:
# $siteUrl = "https://contoso.sharepoint.com/sites/INDIA25"

# --- Step 4: Apply the Block Download Policy ---
# This command will prevent all users from downloading content.
Set-SPOSite -Identity $siteUrl -BlockDownloadPolicy $true

# --- OPTIONAL: Exclude site owners from block download policy ---
# Uncomment the below line to allow site owners to download content.
# Set-SPOSite -Identity $siteUrl -BlockDownloadPolicy $true -ExcludeBlockDownloadPolicySiteOwners $true

# --- Step 5: (Optional) Verify that the policy is set correctly ---
Get-SPOSite -Identity $siteUrl | Select-Object Url, BlockDownloadPolicy

# --- Step 6: Disconnect from SharePoint Online ---
Disconnect-SPOService

# --- OPTIONAL Step 7: Remove the Block Download Policy (Revert) ---
# To remove the block and allow everyone to download again, run:
# Set-SPOSite -Identity $siteUrl -BlockDownloadPolicy $false
