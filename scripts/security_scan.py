import glob

def scan_for_secrets(file_path):
    """
        Scan a file for potential secrets like AWS keys.
    """
    with open(file_path, 'r') as file:
        content = file.read()

    # AWS Acess Key Pattern

    if re.search(r'AKIA[0-9A-Z]{16}', content):
        with open("secret_scan.log", "a") as log_file:
            log_file.write(f"Secret detected in {file_path}!\n")
        print(f"Secret detected in {file_path}!")

# Scan all Terraform files
    for file in glob.glob("*.tf"):
        scan_for_secrets(file_path=file)
        