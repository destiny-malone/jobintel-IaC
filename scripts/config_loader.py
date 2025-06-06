import os
import sys
import yaml
from logger import logger
# from dotenv import load_dotenv


def load_config(config_path):
    """
    Load configuration from a YAML file and environment variables.
    
    Args:
        config_path (str): Path to the YAML configuration file.
        
    Returns:
        dict: Merged configuration dictionary.
    """
    try:

    # Load YAML configuration file
        with open(config_path, 'r') as file:
            raw_config = yaml.safe_load(file)

        # Merge with environment variables
        for section in raw_config:
            if isinstance(raw_config[section], dict):
                for key, value in raw_config[section].items():
                    env_key = f"CONFIG_{section.upper()}_{key.upper()}"
                    if env_key in os.environ:
                        raw_config[section][key] = os.environ[env_key]
        return raw_config
    except Exception as e:
        logger.info(f"Error loading configuration: {e}")
        sys.exit(1)

def main():
    config = load_config("config/security.yaml")
    logger.info(f"Loaded configuration: {config}")

if __name__ == "__main__":
    main()
