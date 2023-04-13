#### Apa Itu Service

Kubernetes Service adalah obyek di Kubernetes yang menyediakan cara untuk mengekspos aplikasi yang berjalan di dalam klaster ke public atau ke aplikasi yang berjalan di dalam klaster itu sendiri. Kubernetes Service memungkinkan kita untuk mengakses aplikasi melalui alamat IP yang persisten dan nama yang mudah diingat, tanpa harus tahu di mana aplikasi itu berjalan atau berapa banyak replika yang ada.

Kita dapat membayangkan Kubernetes Service seperti resepsionis di sebuah gedung perkantoran yang dapat membantu kita menemukan kamar yang kita cari dengan memberikan alamat ruangan dan petunjuk untuk sampai di sana. Tanpa resepsionis, kita mungkin akan kesulitan menemukan ruangan yang ingin dituju.

#### Struktur File YAML Service

Untuk membuat Kubernetes Service, kita perlu membuat file YAML yang mendefinisikan konfigurasi Service. Berikut adalah contoh struktur file YAML Service:

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

Mari kita bahas setiap bagian dari file YAML ini:

- `selector`: Selektor yang digunakan untuk memilih Pod mana yang ingin kita ekspos melalui Service. Selektor ini harus sesuai dengan label yang didefinisikan pada Pod.
- `ports`: Port yang ingin kita ekspos . Kita harus menentukan protocol, port yang digunakan oleh Service, dan port target pada Pod.
- `type`: Tipe Service yang ingin kita buat. Ada beberapa tipe Service yang tersedia, seperti ClusterIP, NodePort, dan LoadBalancer.

Dalam contoh diatas, kita membuat Service dengan nama `my-app-service` yang akan mengekspos aplikasi dengan label `app: my-app` pada port `80`. Service ini juga menggunakan tipe `LoadBalancer`, yang akan membuat alamat IP eksternal yang persisten agar kita bisa mengakses aplikasi dari luar klaster.
