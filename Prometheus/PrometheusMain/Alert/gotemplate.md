```go
{{ define "telegram_message" }}
{{ if gt (len .Alerts) 1 }}
:siren: Multiple Alerts: {{ .CommonLabels.alertname }} :siren: # Common это совпадающая у всех, если не совпадают lable то пустая

{{ range .Alerts }} # Массив объединенных алертов
- Alert Name: {{ .Labels.alertname }}
  Instance: {{ .Labels.instance }}
  Severity: {{ .Labels.severity }}
  Value: {{ .Value }}
  Description: {{ .Annotations.description }}
{{ end }}

{{ else }}
Alert: {{ .CommonLabels.alertname }} # В единичном алерте они будут здесь

Instance: {{ .CommonLabels.instance }}
Severity: {{ .CommonLabels.severity }}
Value: {{ (index .Alerts 0).Value }}

Labels:
{{ range .Alerts.Labels }}
  - {{ .Key }}: {{ .Value }}
{{ end }}

Annotations:
{{ range .Alerts.Annotations }}
  - {{ .Key }}: {{ .Value }}
{{ end }}

{{ end }}

{{ end }}
```
