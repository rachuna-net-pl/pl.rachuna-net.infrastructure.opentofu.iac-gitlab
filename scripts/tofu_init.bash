#!/bin/bash

tofu init \
    -backend-config="address=https://gitlab.com/api/v4/projects/72933257/terraform/state/$TF_STATE_NAME" \
    -backend-config="lock_address=https://gitlab.com/api/v4/projects/72933257/terraform/state/$TF_STATE_NAME/lock" \
    -backend-config="unlock_address=https://gitlab.com/api/v4/projects/72933257/terraform/state/$TF_STATE_NAME/lock" \
    -backend-config="username=$GITLAB_ACCESS_USERNAME" \
    -backend-config="password=$GITLAB_ACCESS_TOKEN" \
    -backend-config="lock_method=POST" \
    -backend-config="unlock_method=DELETE" \
    -backend-config="retry_wait_min=5"