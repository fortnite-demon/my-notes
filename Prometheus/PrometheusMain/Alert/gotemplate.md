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
:siren: Alert: {{ .CommonLabels.alertname }} :siren: # В единичном алерте они будут здесь

Description: {{ .CommonAnnotations.description }}

Instance: {{ .CommonLabels.instance }}
Severity: {{ .CommonLabels.severity }}
Value: {{ (index .Alerts 0).Value }}

{{ end }}

[View in Prometheus]({{ .ExternalURL }})
{{ end }}
```
