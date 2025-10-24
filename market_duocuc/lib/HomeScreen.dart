import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'package:intl/intl.dart';
import 'AcercaDeScreen.dart';
import 'IntegrantesScreen.dart';

// Modelo de Producto
class Producto {
  final String nombre;
  final String descripcion;
  final double precio;
  final String imagen;
  final String categoria;
  final List<String> especificaciones; // <-- nuevo campo

  Producto({
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.imagen,
    required this.categoria,
    required this.especificaciones, // <-- obligatorio al crear
  });
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Lista de productos
  final List<Producto> productos = [
    Producto(
      nombre: "Notebook HP Pavilion x360 14-ek0010la",
      descripcion:
          "Intel Core i3, 8GB RAM, 512GB SSD, 14 Táctil FHD, Windows 11 Pro",
      precio: 449990,
      imagen: "assets/images/hp.png",
      categoria: "Electrónica",
      especificaciones: [
        "Marca procesador notebook: Intel",
        "Memoria RAM: 8GB",
        "Capacidad de almacenamiento: 512 GB",
        "Tipo de GPU: Intel Iris Xe Graphics",
        "Tamaño de la pantalla: 14",
        "Núcleos del procesador: Deca core",
      ],
    ),
    Producto(
      nombre: "Apple iPhone 16 Pro",
      descripcion: "128GB, Titanio Azul, Chip A17 Pro",
      precio: 1190990,
      imagen: "assets/images/iphone15.png",
      categoria: "Celulares",
      especificaciones: [
        "Tamaño de la pantalla: 6.3",
        "Capacidad de almacenamiento: 128 GB",
        "Memoria RAM: 8GB",
        "Cámara posterior: 16 MP",
      ],
    ),

    Producto(
      nombre: "Sony WH-1000XM5",
      descripcion: "Audífonos Bluetooth con cancelación de ruido",
      precio: 259990,
      imagen: "assets/images/audi_sony.png",
      categoria: "Audio",
      especificaciones: [
        "Tipo: Audífonos Over-Ear",
        "Cancelación de ruido: Sí",
        "Cuenta con bluetooth: Sí",
        "Incluye micrófono: Sí",
        "Inalámbrico: Sí",
        "Resistente al agua: No",
      ],
    ),

    Producto(
      nombre: "Samsung Smart TV 55\"",
      descripcion: "4K Vision AI Smart TV (2025)",
      precio: 599990,
      imagen: "assets/images/tv.png",
      categoria: "Electrónica",
      especificaciones: [
        "Resolución de pantalla: 4K HDR",
        "Tecnología del Televisor: QLED",
        "Cantidad de puertos HDMI: 3",
        "Cantidad de puertos USB: 1",
        "Sistema operativo: Tizen",
        "Conexión WiFi: Sí",
      ],
    ),
    Producto(
      nombre: "Apple MacBook Pro 2022 M2",
      descripcion:
          "Pantalla Retina de 13, 8GB RAM, 256GB SSD - Gris (Reacondicionado)",
      precio: 779990,
      imagen: "assets/images/Mac.png",
      categoria: "Computadores",
      especificaciones: [
        "Marca procesador notebook: iOS",
        "Memoria RAM: 8GB",
        "Capacidad de almacenamiento: 256 GB",
        "Tipo de GPU: integrada",
        "Tamaño de la pantalla: 13.3",
        "Núcleos del procesador: Octa core",
      ],
    ),
    Producto(
      nombre: "PlayStation 5",
      descripcion: "Consola PS5 Slim Standard + 2 Juegos Sony",
      precio: 499990,
      imagen: "assets/images/ps5.png",
      categoria: "Gaming",
      especificaciones: [
        "Tipo: PS5",
        "Capacidad de almacenamiento: 1 TB",
        "Incluye Juegos: Sí",
        "Núcleos del procesador: No aplica",
        "Conectividad/conexión: Wifi",
        "Procesador: AMD Ryzen",
      ],
    ),
    Producto(
      nombre: "Canon EOS R6 MK II",
      descripcion: "Cámara Kit Con 24-105mm Lente Sin Adaptador - Negro",
      precio: 2499990,
      imagen: "assets/images/camara.png",
      categoria: "Fotografía",
      especificaciones: [
        "Tipo de cámara: Cámaras profesionales",
        "Cámara posterior: 24.2 MP",
        "IEnfoque/Autofoco: Sí",
        "NDimensiones: 14 × 10 × 8",
        "Detalle de la Condición: Para Estrenar",
      ],
    ),
    Producto(
      nombre: "iPad Air 11",
      descripcion: "M3, 128GB, Wi-Fi",
      precio: 749990,
      imagen: "assets/images/ipad.png",
      categoria: "Tablets",
      especificaciones: [
        "CPU: Apple series",
        "Capacidad de almacenamiento: 128 GB",
        "Sistema operativo: iPadOS",
        "Tipo de Pantalla Tablet: IPS LCD",
        "Tamaño de la pantalla: 11 pulgadas",
      ],
    ),
  ];

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cerrar Sesión'),
          content: const Text('¿Estás seguro que deseas cerrar sesión?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Loginscreen()),
                  (route) => false,
                );
              },
              child: const Text(
                'Cerrar Sesión',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Row(
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/images/logo1.png',
                height: 75,
                width: 75,
              ),
            ),
            const SizedBox(width: 10),
            const Text("Market DuocUC"),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Carrito de compras"),
                  backgroundColor: Colors.deepOrangeAccent,
                ),
              );
            },
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepOrangeAccent.withOpacity(0.1), Colors.white],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: productos.length,
          itemBuilder: (context, index) {
            return _buildProductCard(context, productos[index], index);
          },
        ),
      ),
    );
  }

  // Drawer
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepOrangeAccent, Colors.orangeAccent],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Usuario DUOC",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "duoc@duocuc.cl",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.shopping_bag,
              color: Colors.deepOrangeAccent,
            ),
            title: const Text("Productos"),
            selected: true,
            selectedTileColor: Colors.deepOrangeAccent.withOpacity(0.1),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: Colors.deepOrangeAccent,
            ), // cambio aquí
            title: const Text("Acerca de"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/acerca');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.people,
              color: Colors.deepOrangeAccent,
            ), // cambio aquí
            title: const Text("Integrantes"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/integrantes');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Cerrar Sesión"),
            onTap: () {
              Navigator.pop(context);
              _logout(context);
            },
          ),
        ],
      ),
    );
  }

  // Card de producto
  Widget _buildProductCard(BuildContext context, Producto producto, int index) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen/emoji
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Image.asset(producto.imagen, fit: BoxFit.contain),
              ),
            ),
            const SizedBox(width: 16),
            // Info producto
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    producto.nombre,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    producto.descripcion,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${NumberFormat('#,###', 'es_CL').format(producto.precio)}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _showProductDetail(context, producto),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrangeAccent,
                        ),
                        child: const Text("Ver más"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Mostrar detalle del producto
  void _showProductDetail(BuildContext context, Producto producto) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // permite que el BottomSheet crezca
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen del producto
                Center(
                  child: Image.asset(
                    producto.imagen,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 16),

                // Nombre del producto
                Text(
                  producto.nombre,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // Descripción corta
                Text(
                  producto.descripcion,
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                const SizedBox(height: 16),

                // Categoría
                Text(
                  "Categoría: ${producto.categoria}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),

                // Precio
                Text(
                  "Precio: \$${NumberFormat('#,###', 'es_CL').format(producto.precio)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent,
                  ),
                ),

                const SizedBox(height: 24),

                // 🔹 Especificaciones principales
                if (producto.especificaciones.isNotEmpty) ...[
                  const Text(
                    "Especificaciones principales: ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: producto.especificaciones
                        .map(
                          (spec) => Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              "- $spec",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 24),
                ],

                // Botones
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "${producto.nombre} agregado al carrito",
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text("Agregar al carrito"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text("Volver"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
