# Configures environment for WiscSIMS lab

export PROJECT_DIR="$SPARROW_CONFIG_DIR"
export SPARROW_PATH="$PROJECT_DIR/Sparrow"
export SPARROW_LAB_NAME="WiscSIMS"

# Keep volumes for this project separate from those for different labs
export COMPOSE_PROJECT_NAME="${SPARROW_LAB_NAME}"
export SPARROW_SECRET_KEY="test"

export SPARROW_DATA_DIR="${PROJECT_DIR}/Test-Data"
export SPARROW_COMPOSE_OVERRIDES="${PROJECT_DIR}/importer-container.yaml"
export SPARROW_COMMANDS="$PROJECT_DIR/bin"
export SPARROW_SITE_CONTENT="$PROJECT_DIR/site-content"
export SPARROW_ENV="development"

export MAPBOX_API_TOKEN="pk.eyJ1IjoidGhlZmFsbGluZ2R1Y2siLCJhIjoiY2tsOHAzeDZ6MWtsaTJ2cXhpMDAxc3k5biJ9.FUMK57K0UP7PSrTUi3DiFQ"
