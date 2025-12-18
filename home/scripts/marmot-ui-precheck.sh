#!/bin/bash
# Marmot UI Precheck Script
# Runs EXACTLY what GitHub Actions PR checks run (ui-pr-checks.yaml)

set -e

MARMOT_UI_DIR="/Users/sam.ellis/Desktop/Work/marmot/marmot-ui"

cd "$MARMOT_UI_DIR"

echo "🚀 Running Marmot UI PR Checks (matching GitHub Actions)..."
echo ""

echo "📥 Installing dependencies..."
yarn install

echo ""
echo "🔬 Linting..."
yarn lint

echo ""
echo "💅🏻 Checking formatting..."
yarn fmt:check

echo ""
echo "🏗️  TypeScript checking..."
yarn typecheck

echo ""
echo "🧪 Running tests..."
yarn test

echo ""
echo "📦 Manypkg check..."
yarn manypkg

echo ""
echo "✅ All PR checks passed! Ready to push. 🎉"
