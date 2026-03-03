#!/bin/bash
# Deploy FruitAPI to Azure Web App
# Prerequisites: Azure CLI installed and logged in (az login)
# Note: Requires App Service quota in your subscription

set -e
cd "$(dirname "$0")"

APP_NAME="${APP_NAME:-fruitapi-dlux}"
RESOURCE_GROUP="${RESOURCE_GROUP:-fruitapi-rg}"
PLAN_NAME="${PLAN_NAME:-fruitapi-plan}"
LOCATION="${LOCATION:-westus2}"
SKU="${SKU:-F1}"  # Use B1 for production

echo "Deploying FruitAPI to Azure..."
az webapp up \
  --name "$APP_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --runtime "DOTNETCORE:8.0" \
  --plan "$PLAN_NAME" \
  --location "$LOCATION" \
  --os-type Linux \
  --sku "$SKU"

echo ""
echo "Deployment complete!"
echo "Your API should be available at: https://${APP_NAME}.azurewebsites.net"
echo "Try: curl https://${APP_NAME}.azurewebsites.net/fruits"
