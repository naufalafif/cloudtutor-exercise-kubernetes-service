### Membuat Service

#### Siapkan Aplikasi

Sebelum kita membuat Service, pertama-tama kita perlu membuat Deployment. Deployment ini yang nantinya akan diexpose menggunakan Service

Buat file bernama `deployment.yaml` dengan konten berikut:

```{.yaml .copy}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: my-container
        image: nginx
        ports:
        - containerPort: 80
```

Jalankan perintah berikut untuk membuat Deployment:

```{.bash .copy}
kubectl apply -f deployment.yaml
```

#### Membuat Service

Buat file bernama `service.yaml` dengan konten berikut:

```{.yaml .copy}
apiVersion: v1
kind: Service
metadata:
  name: my-app-service
spec:
  selector:
    app: my-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: LoadBalancer
```

Jalankan perintah berikut untuk membuat Service:

```{.bash .copy}
kubectl apply -f service.yaml
```

Cek apakah service telah dibuat

```{.bash .copy}
kubectl get services
```

Kita akan melihat Service baru yang telah dibuat dengan nama `my-app-service`.

#### Mengakses Aplikasi

> Kita tidak bisa mengakses ip dari service secara langsung karena type LoadBalancer memerlukan real LoadBalancer dari cloud provider.

> Kita bisa melakukan setup manual untuk memberikan support LoadBalance manual dengan mengikuti petunjuk di pada link https://kind.sigs.k8s.io/docs/user/loadbalancer/

Setelah Service berhasil dibuat, kita bisa mem-forward service agar bisa diakses dari luar node

Forward service menggunakan perintah berikut

```{.bash .copy}
kubectl port-forward service/my-app-service 8000:80
```

Akses aplikasi melalui localhost port 8000 atau pada url dibawah

```{.bash .copy}
https://#ID#-8000.host.cloudtutor.io
```

Kita telah berhasil membuat dan menggunakan Service di Kubernetes untuk mengekspos aplikasi yang berjalan di Pod.
