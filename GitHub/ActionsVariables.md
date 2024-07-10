$GITHUB_OUTPUT: ```echo "var=value" >> $GITHUB_OUTPUT```

$GITHUB_ENV: ```echo "var=value" >> $GITHUB_ENV``` для передачи значений между шагами

$GITHUB_STEP_SUMMARY: ```echo "Example text :rocket:"``` для добавления описания после выполнения workflow
- ```rm $GITHUB_STEP_SUMMARY:``` удаление

$GITHUB_PATH: ```echo "$HOME/.local/bin" >> $GITHUB_PATH``` добавления своего пути в $PATH
