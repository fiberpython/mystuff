

import logging

# Create and configure logger
LOG_FORMAT = "%(asctime)s - %(message)s"

logging.basicConfig(filename = "/tmp/Python_lumberjack.log",
					level = logging.DEBUG,
					format = LOG_FORMAT)
logger = logging.getLogger()

# Root logger

# Test the logger
logger.info("Our Bloody first message")

print(logger.level)


