#!/bin/bash
cd /home/kavia/workspace/code-generation/bmi-calculator-220305-220314/frontend_bmi_calculator
npm run build
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
   exit 1
fi

