```go
{{ define "telegram_message" }}
:siren: Alert: {{ .CommonLabels.alertname }} :siren: # Общие метки для всех

Description: {{ .CommonAnnotations.summary }}

Instance: {{ .CommonLabels.instance }}
Severity: {{ .CommonLabels.severity }}

{{ range .Alerts }} # Range всех сгруппированых алертов
- Alert: {{ .Labels.alertname }}
  Summary: {{ .Annotations.summary }}
  Description: {{ .Annotations.description }}
{{ end }}

{{ if }}

{{ else }}

{{ end }}

{{ end }}
```
