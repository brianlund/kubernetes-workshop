#!/bin/sh


# Add a welcome text with your own name to the website
echo "Welcome <yourname>, below is the effective IAM information<BR>" > /usr/share/nginx/html/index.html

# Get the current IAM caller identity to show the role in effect and prepare it to the nginx index file
/root/.local/bin/aws sts get-caller-identity >> /usr/share/nginx/html/index.html;



# Start nginx
nginx -g "daemon off;"
