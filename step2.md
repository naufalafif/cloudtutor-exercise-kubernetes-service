Terdapat tiga tipe Service yang tersedia di Kubernetes: ClusterIP, LoadBalancer, dan NodePort. Mari kita bahas satu per satu.

#### ClusterIP

ClusterIP adalah tipe Service default di Kubernetes. Ketika kita membuat Service tanpa menentukan tipe, Kubernetes akan secara otomatis membuat Service dengan tipe ClusterIP.

ClusterIP digunakan untuk mengekspos aplikasi ke dalam klaster. Service ini hanya bisa diakses dari dalam klaster, dan tidak bisa diakses dari luar. ClusterIP menyediakan alamat IP virtual yang persisten untuk Service tersebut.

Kita bisa membayangkan ClusterIP seperti nomor telepon internal di sebuah gedung perkantoran. Nomor telepon ini hanya bisa diakses dari dalam gedung, dan tidak bisa diakses dari luar.

Berikut adalah contoh penggunaan ClusterIP di file YAML Service:

```{.yaml}
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
      targetPort: 8080
```

#### LoadBalancer

LoadBalancer digunakan untuk mengekspos aplikasi ke luar klaster, sehingga aplikasi bisa diakses dari internet atau jaringan lainnya. LoadBalancer menyediakan alamat IP virtual yang persisten dan memungkinkan lalu lintas jaringan didistribusikan ke beberapa replika.

Kita bisa membayangkan LoadBalancer seperti resepsionis di sebuah gedung perkantoran yang memberikan alamat ruangan dan petunjuk untuk sampai di sana kepada tamu yang ingin mengunjungi gedung tersebut.

Namun, LoadBalancer memerlukan provider layanan cloud untuk bekerja, karena provider tersebut yang menyediakan layanan load balancer untuk mengatur lalu lintas jaringan.

Berikut adalah contoh penggunaan LoadBalancer di file YAML Service:

```{.yaml}
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
      targetPort: 8080
  type: LoadBalancer
```

#### NodePort

NodePort digunakan untuk mengekspos aplikasi ke seluruh node dalam klaster. NodePort menyediakan alamat IP virtual pada setiap node dalam klaster dan mengalihkan lalu lintas jaringan ke Service yang sesuai.

Anda bisa membayangkan NodePort seperti nomor telepon yang dapat diakses dari seluruh gedung perkantoran. Masing - masing nomor mengarah ke gedung (node) spesifik

Namun, NodePort bisa membuka celah keamanan jika kita tidak membatasi jaringan yang diizinkan mengakses Service tersebut.

Berikut adalah contoh penggunaan NodePort di file YAML Service:

```{.yaml}
apiVersion: v1
kind: Service
metadata:
  name: my-app-service
spec:
  selector:
    app: my-app
  ports:
    - protocol: TCP
      port: 30001
      targetPort: 8080
  type: NodePort
```
