### Скачивает лог файл

```yml
name: test

on: [workflow_dispatch]

jobs:
  example-job:
    name: Save output
    runs-on: ubuntu-latest
    steps:
      - shell: bash
        run: |
          expr 1 + 1 > output.log
      - name: Upload output file
        uses: actions/upload-artifact@v4
        with:
          name: output-log-file
          path: output.log
          
  example2-job:
    needs: example-job
    runs-on: ubuntu-latest
    steps:
      - name: Download a single artifact
        uses: actions/download-artifact@v4
        with:
          name: output-log-file
```
