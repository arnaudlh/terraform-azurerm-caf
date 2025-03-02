#!/bin/bash

# Test Runner Script for CAF Module Tests
# This script provides utilities for running different types of tests

set -e

# Default values
TEST_DIR="./examples/tests/mock"
VERBOSE=false
FILTER=""
TEST_TYPE="all"

# Display help message
function show_help {
  echo "Test Runner for CAF Module"
  echo ""
  echo "Usage: $0 [options]"
  echo ""
  echo "Options:"
  echo "  -h, --help                 Show this help message"
  echo "  -d, --directory DIR        Test directory (default: $TEST_DIR)"
  echo "  -v, --verbose              Enable verbose output"
  echo "  -f, --filter PATTERN       Filter tests by pattern"
  echo "  -t, --type TYPE            Test type: all, component, integration, validation"
  echo ""
  echo "Examples:"
  echo "  $0 --type component                   Run all component tests"
  echo "  $0 --filter compute_tests.tftest.hcl  Run specific test file"
  echo "  $0 --type integration --verbose       Run integration tests with verbose output"
  echo ""
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    -h|--help)
      show_help
      exit 0
      ;;
    -d|--directory)
      TEST_DIR="$2"
      shift
      shift
      ;;
    -v|--verbose)
      VERBOSE=true
      shift
      ;;
    -f|--filter)
      FILTER="$2"
      shift
      shift
      ;;
    -t|--type)
      TEST_TYPE="$2"
      shift
      shift
      ;;
    *)
      echo "Unknown option: $1"
      show_help
      exit 1
      ;;
  esac
done

# Set verbose flag
VERBOSE_FLAG=""
if [ "$VERBOSE" = true ]; then
  VERBOSE_FLAG="-verbose"
fi

# Set filter flag
FILTER_FLAG=""
if [ -n "$FILTER" ]; then
  FILTER_FLAG="-filter=$FILTER"
fi

# Run tests based on type
case $TEST_TYPE in
  all)
    echo "Running all tests..."
    terraform -chdir=./examples test -test-directory=$TEST_DIR $VERBOSE_FLAG $FILTER_FLAG
    ;;
  component)
    echo "Running component tests..."
    terraform -chdir=./examples test -test-directory=$TEST_DIR/component_tests $VERBOSE_FLAG $FILTER_FLAG
    ;;
  integration)
    echo "Running integration tests..."
    terraform -chdir=./examples test -test-directory=$TEST_DIR/integration_tests $VERBOSE_FLAG $FILTER_FLAG
    ;;
  validation)
    echo "Running validation tests..."
    terraform -chdir=./examples test -test-directory=$TEST_DIR/validation_tests $VERBOSE_FLAG $FILTER_FLAG
    ;;
  *)
    echo "Unknown test type: $TEST_TYPE"
    show_help
    exit 1
    ;;
esac

echo "Tests completed successfully!"
