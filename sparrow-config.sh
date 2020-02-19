# Configures environment for WiscSIMS lab

export PROJECT_DIR="${0:h}"
export SPARROW_PATH="$PROJECT_DIR/Sparrow"
export SPARROW_LAB_NAME="WiscSIMS"

# Keep volumes for this project separate from those for different labs
export COMPOSE_PROJECT_NAME="${SPARROW_LAB_NAME}"
export SPARROW_SECRET_KEY="test"

export SPARROW_DATA_DIR="${PROJECT_DIR}/Test-Data"
export SPARROW_COMPOSE_OVERRIDES="-f ${PROJECT_DIR}/importer-container.yaml"
export SPARROW_COMMANDS="$PROJECT_DIR/bin"
export SPARROW_SITE_CONTENT="$PROJECT_DIR/site-content"
