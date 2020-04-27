# Create a new project directory
cd !
~/
mkdir owncloud-docker-server

cd owncloud-docker-server

# Copy docker-compose.yml from the GitHub repository
wget https://raw.githubusercontent.com/owncloud/docs/master/modules/admin_manual/examples/installation/docker/docker-compose.yml

# Create the environment configuration file
cat << EOF > .env
OWNCLOUD_VERSION=10.4
OWNCLOUD_DOMAIN=localhost
ADMIN_USERNAME=user
ADMIN_PASSWORD=1111
HTTP_PORT=8090
EOF

# Build and start the container
docker-compose up -d
