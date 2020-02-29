{{- /* statefulset 
note: headless is a requirement for statefulsets make sure you define that
*/ -}}
{{- define "statefulset.tpl" -}}
apiVersion: apps/v1
kind: StatefulSet
spec:
  selector:
    matchLabels:
      app: {{ .Values.appName }}
  serviceName: {{ .Values.appName }}
  replicas: {{ .Values.replicaCount }}
  updateStrategy:
    type: RollingUpdate
  podManagementPolicy: Parallel
  template:
    metadata:
      labels:
        app: {{ .Values.appName }}
        release: {{ .Release.Name }}
    spec:
      containers:
{{ include "container.tpl" . | indent 6 -}}
{{- end -}}
