```.Alerts``` - Массив всех алертов  

```.Common..``` - Совпадающие значения, если не совпадают то пустое, у одиночных алертов есть значения  


```go
{{ define "telegram_message" }}
{{ if gt ( len .Alerts) 1 }}
Multiple alerts!
{{ range .Alerts }}
- AlertName: {{ .Labels.alertname }}
  Severity: {{ .Labels.severity }}
  Summary: {{ .Annotations.summary }}
  Description: {{ .Annotations.description }}
  StartsAt: {{ .StartsAt.Format "2006-01-02 11:01:01 MSK" }}
{{ end }}

{{ else }}

{{ if ( index .Alerts 0).Status "Firing" }}
Alert {{ .CommonLabels.alertname }] active!

Details:
  Instance: {{ .CommonLabels.instance }}
  Severity: {{ .CommonLabels.severity }}
  Summary: {{ .CommonAnnotations.summary }}
  Description: {{ .CommonAnnotations.description }}

StartsAt: {{ ( index .Alerts 0 ).StartsAt.Format "2006-01-02 11:01:01 MSK" }}

{{ else }}
Resolved: The alert {{ .CommonLabels.alertname }} has been resolved
StartsAt: {{ ( index .Alerts 0 ).StartsAt.Format "2006-01-02 11:01:01 MSK" }}
EndsAt:  {{ ( index .Alerts 0 ).EndsAt.Format "2006-01-02 11:01:01 MSK" }}
{{ end }}

{{ end }}

{{ end }}
```
