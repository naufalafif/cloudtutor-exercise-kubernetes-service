Gunakan service yaml berikut

```{.yaml .copy}
apiVersion: v1
kind: Service
metadata:
  name: my-app-service-nodeport
spec:
  selector:
    app: my-app
  ports:
    - protocol: TCP
      port: 3030
      targetPort: 80
  type: NodePort
```
