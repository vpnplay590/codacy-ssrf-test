"""Post billing-bypass AI re-review trigger"""
# This file is benign on purpose to test whether AI Reviewer runs
# after the organization was upgraded to codacy-team-yearly via /billing/change-plan
# without payment. Result should be either an AI-generated PR comment
# (proving premium AI unlocked) OR silence (proving AI doesn't actually run).

import logging

logger = logging.getLogger(__name__)

def init_logger():
    h = logging.StreamHandler()
    fmt = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
    h.setFormatter(fmt)
    logger.addHandler(h)
    logger.setLevel('INFO')

if __name__ == '__main__':
    init_logger()
    logger.info('Logger initialized')
