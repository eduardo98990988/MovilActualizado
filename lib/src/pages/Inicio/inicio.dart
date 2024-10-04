import 'package:app/src/pages/material/materialAdapter.dart';
import 'package:app/src/pages/productos/producAdapter.dart';
import 'package:app/src/pages/proveedor/proveedorAdapter.dart';
import 'package:app/src/pages/vistas/vistaSandalia/vistaSanadalia_vista.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inicio con Zapatos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeInicio(),
    );
  }
}

class HomeInicio extends StatelessWidget {
  const HomeInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 3, 63, 112),
              ),
              child: Text('Menú',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 24)),
            ),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeInicio()));
              },
              child: const Text('INICIO'),
            )
                .animate()
                .fadeIn(duration: 500.ms)
                .move(begin: const Offset(-16, 0), end: const Offset(0, 0)),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomeProduc()));
              },
              child: const Text('PRODUCTOS'),
            )
                .animate()
                .fadeIn(duration: 500.ms)
                .move(begin: const Offset(-16, 0), end: const Offset(0, 0)),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomeMaterial()));
              },
              child: const Text('MATERIALES'),
            )
                .animate()
                .fadeIn(duration: 500.ms)
                .move(begin: const Offset(-16, 0), end: const Offset(0, 0)),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomeProveedor()));
              },
              child: const Text('PROVEEDORES'),
            )
                .animate()
                .fadeIn(duration: 500.ms)
                .move(begin: const Offset(-16, 0), end: const Offset(0, 0)),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomeMaterial()));
              },
              child: const Text('VENTAS'),
            )
                .animate()
                .fadeIn(duration: 500.ms)
                .move(begin: const Offset(-16, 0), end: const Offset(0, 0)),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
              },
              child: const Text('AJUSTES'),
            )
                .animate()
                .fadeIn(duration: 500.ms)
                .move(begin: const Offset(-16, 0), end: const Offset(0, 0)),
          ],
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.8,
        ),
        itemCount: shoes.length,
        itemBuilder: (context, index) {
          return ShoeItem(
            image: shoes[index]['image']!,
            name: shoes[index]['name']!,
          );
        },
      ),
    );
  }
}

class ShoeItem extends StatelessWidget {
  final String image;
  final String name;

  const ShoeItem({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          name,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Acción al presionar el botón
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const VistaHomeSandalia()));
          },
          child: const Text('VER'),
        )
            .animate()
            .fadeIn(duration: 500.ms)
            .move(begin: const Offset(-16, 0), end: const Offset(0, 0)),
      ],
    );
  }
}

const List<Map<String, String>> shoes = [
  {
    'image':
        'data:image/jpeg;base64,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',
    'name': 'Zandalia',
  },
  {
    'image':
        'data:image/jpeg;base64,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',
    'name': 'Zapatilla',
  },
  {
    'image':
        'data:image/jpeg;base64,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',
    'name': 'Botines',
  },
  {
    'image':
        'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAJQAlQMBIgACEQEDEQH/xAAcAAAABwEBAAAAAAAAAAAAAAAAAQIDBQYHBAj/xAA8EAABAwIEBAQEAwcCBwAAAAABAAIDBBEFBiExEkFRYQcTInEygaHBI0KRFBVSYrHR8DPxJCU0Q1Oy4f/EABkBAAMBAQEAAAAAAAAAAAAAAAABAwIEBf/EAB8RAQEAAgIDAQEBAAAAAAAAAAABAhEDIRIxQSJRE//aAAwDAQACEQMRAD8A1khGDYIIKS4HVJHxBGi9t0AfPdAC2pRakpLnXTBVyUY1TbSlHZAK1tYI6qXyoSdkTBY3K5MVf+HY7KWdbxih5undK7U6cu6qZOqmsz1IfVcDSCG9FAcQJ1Kk6Z6WnI1CKvGBK8Xjp28RuOZ0CvuL1kOGYbU19QbRQRl579B9lhcWc8QyzmFr6Z3HSloE9Mdnj35FWfxMzlRYvl3D6fCZeNldeaa27GtIAa4deL/1XTxzUcvLlus1xGrlrqyarqDeWZ5e/wByuJ5Tj3Jpx0VXMQ46JtG4pKACCU0E7AlBBvXwFxc7o7ekoxqEG6KaxKSQlEoWuEgSSDsgG6I7drIwCgE8ACInhFzslHuqt4juxkZYlOBNcZQ8Gby/jbGNSWjmbgfJAWoEBt9VTs24wICY4zd5HXZV3LninBUUn7HjY8isaOETW9Env/CVDYpWuqamSUuuHHT2UcpZe3Rx6pqoeZ3lznalck7mUzHzPt6Re6UHucdNQq1mrEg+1JETbd5+yWOO63yZeOO0DVTPq6qSYjifI7QLtLWxsEbTfh3PUpihjAD5SALaN9+dk489V2aedvfZDymXlLcUydSghFGB9EFfPCvKP7/xVtfWR3w6jeHG+0sgsQ3uBufkOaDkWjw+8O6GTBG1mYqTzpqqz4onEjymW0v3N7n5d0Fp7db9kFnakxjtFh+iIGxui0aLoHZZaGDZKHdEBdH7oAiEQvZLtf36IttCgiQkzODGOdslGwGqi8UqgyLhU+S6V45tnue8l4fibZa6j4aWsvxOI+CT3H9llL3Yng0hY4Hyxy3afbotlxysJpXtB30VBxiaOGmcX21FgDzWcc76Uy4prcV6bMk74Q2KERm1ib3URDFPW1TIoWOmnmeGtY0aucdgkS2MzyNr8lsngdkzQZnxKPe7aFpHuHSfYfMro6xnTjyyuV7VHHch5iwGlbJU4e6SnaNZaY+YG9b21H6KpvI5HReu6uQNYfZZVnbJuFYrK6enjFHVk6yQiwef5m7H6FZnJ/Wv89sScUndTGOZdxLByTUwl0I2mjF2/PoogDXr7Lcu2LLPaSy5gtVj+MU+G0bfXK71OI0jbzeewH9bL0pgmF0uDYZBQULeGCFgaL7uPNx7lVjwqynLl3CH1Vc1orq4NcRb1RR20YT1uST/APFdyP1Wa1jPpDSG6XQSwEEmjpcC3SxsUq1yO6SywOyUD6r6oMrjJKGmpOtkkD1kn9EZOvc7BAKvfXmhoRdVLM2fsDy+HRSVIqaoH/p6eznD3Ow+azvMPi3ilfG6DCKdmHwnQyE8Up+w+qNUrZGzunidK6ESNMjR6mg3LR3Vdxibjlfb4QVn+Qs+YZhVJNS4m2WOpmkL31jvWJCf4juLforJiWasA8guZitJJcX9Mouocktro4rjr2hseqA0WJAA1N1mmO1rqip472a3SNvXupTM+Zo6uRzKP1NP5zoFBYLhlXj2L02HUt3T1D+EOINmjmT7BU4sLJusc3JL+cU94c5OmzbjbWSscMOhIdVyg20/gB6n6BenIYoqeBkULGxxRtDWMaLBoGwCiMr4FR5dweDD6JgDGD1vtrI47uKkaucMj4RuUZZ7SmOnFiNTbiA+JVydhe/icpWoBkJcomuqGQgjmp10YRGYl5ZHlWDmkagi91FZcyDQ1GY4cWDWtpKc8b6c7OkHw27X1PyXW9xkeXXVjwuvgpMNhj4g12pd3N/9k+O3Y5ZNLG489AefdN+YN7hQM2Owg/ED81ySY9H+U2PdV2jpZnVDQdXWQVOfjtz+U97oIHjV+LBYkcyhY7Cw03Q4rDmj3A4iEyJBsDzsFTPFnHJ8Gyt/wcjoqmqmEDXsNi1tiXEd7C3zV0OnpWfeNdG+fK0VSzVlJUtdI0bkOHDf5EhMqwtzgSSSb9ymy4BFM0B3pddMm4W0jhkTbnXREoNBc4NaCSTYAC5JQAAJWneCMNLFmyVk3D57qV/lPd1uLgfJSvhl4bOgfFjOYoR5gs+no3i/B0c8deg5blQOeKKpyZnYYjh3ojlkNXSnlcn1x/qTp0cFO2XpuY3HtvlRUMhFri/IKMnqRI65IsoHDcxU2OUUNXTH/Vb6mndjuYKXU1PlhQromtJWedkUTnkiwVNrqp1RO4/luna+tknBaCQ0clxHgY0ve4Btrnss3tfGSQmWdsED5XkBrRckqm4RmeeqqZqaaW/qJhd2vsuLOGZRXE0NA/8A4Vp9cg/7h6DsqvBM6CeOZnxMcHBX4+PU7cvJy/rppZqql+x0RD9pfawcpnCaBlXRwVUOsUzA9p6gqagwsNA4mjt3Rpryipilntd5IPRBXpmHRBt3R3PcIJ6HktouW63CUbkDS3uisGm4Bv3SS13FxX5arSRQkPHwj5+y4Mfw6HGcHrMNmdZlQws4h+U8j+q63WYPMeQABckmwAHVZHmrxZqW1klPluGAU7SWiqnbxmTu1t9B0vdAt0ouYsl45gU721FG+aIHSeAFzSOvUKuOY9nxNc33BCudR4jZoqWGOSujDSLemmYPsoGbE6qdxc+UknfQBa7T6RIBcRYE32AG62LwqyBJBLHjmOQlkgHFS00jdW/zuB2PQfNO+FGXcLqaT981bG1FbHLZjXAFsRABBA691pcj7HR1lHPk+RfDi1d07NLwCzd/6Kq51wSHMGBz08hAqGeunlP5H/2OxU9K/Q3O6j6uQeWQpS67Wsl6ZXlvFKLCMSdQ07wGNHrkkeQZJAbEAbDt1srnU4hBUv8Aw3+nhGqqWdMtUEhmxQzupmtHFOGMDuPuBcepUc4zVQ1IdRSPhhYwRxxl17NHXqdSq+Pn3EPLw6rU6/EKahidLPIGhuqzvMmaJsU4oKYOhpeYv6n+/bsoStrJ6yUvqJnyOPJ5uB7Jhbx45O6znzXLqEoxuglwRSTzRwwML5ZHBjGN3c47BURb74ZU3HkrC3vHFeN2/L1GytX7O0W4Wi4GiYyzhgwfL2G4abF9PA1jyObran9bqTJAPCP6LC0cvk2Hw8SC6Q7+EW+SJIOq4JP0QOosdRe6bBsLm5J5JfLe6YVLxUxE4dkytDOISVNqdhaebjqf0BXnhxJC27xyn4Ms0UOtpKz+jHFYcSnGM/YrlG1xukcSO60w0bwmx9tHiMuHzPsKgfhhx04gteL+JtzsvLzJXRua5ji1zTdpabEHqrjhfiZjNJGyKubFXMYLBz7tf8yND+ijnxW9x0Yc3Wq2Gpm9dgdN1F4hVtZHcuWa1fiXWvJ8mihYTzc8ut9FXMUzPiuJgtqKjgZ/DEOEH5rE4r9bvNj8WDPOYoqmnfh1K/i4iPMcNgBy+io6InS5NlcsreHONY9wTyt/YKI6+dO08Th/K3f5myvjjMZpz5ZXO7U5G5j2Bpc0gOF2kjQjstqxDJOA5XwCV8NMamufwsFTUniIudeFuwNr9+6zPN9S18tPStN3QgucehNrD/OqPL9aPw1jtABbD4R5P/ZY4cwYlF+NMCaSNw+BlvjPc8u3uqj4Y5TGZMX86sb/AMtpHAzaf6ruTPue3ut/aOK2wF7DYABFoxn0oEkg8JFtNUUjrW4nAAH9Ul17i1r309kl54PUdSedtkmjnmHdoNj1QTbrk2a5rbb3QQbpYbk23KUXd0yw2Ght7lGX3sQR1QSGzjl+HM2CS0Ez+CUHzIZbX4Hjb5civOmMYXWYNiElFiMJimYeezh1B5heob2jsTe5+ihsyZdwzMdEabEow4t1ZI342Hsfsjeis280FFdWvNeQ8Vy8XTNjfVUWtpmN1aP5hyVSJHIrUqdlg7oi5FdBMhgpUMUk8zIYWOfLIeFjGi5cUgDkArplBsOBTsramMPrSPS3/wAY/ulbprGbq+ZG8PKLBooq7GWMnxI+oMdqyDTYDYu7q+GcNHAHd/iuVm7s5SPG7geQuuabNEj9TKRfdY2rrSV8RcVZ+DBxHyoGOmf77D7rGooqnFsRbHE3jqamQBre5+39lPZqxZ9TEQ513zuuezR/gSsjRikqHYk/423bCP6n/O6Mf6WXuYtpy1htNgGC0+GUrfS0XmkvYvfzKlHVcbSWhwt0Czg4/K6wLnEX6pbceeG2Dt90bPTQX4hG03tra1mlNvqQ+xNmuHU7KjNx0/l0v0RHGSdnfVGz0uklcwkXPF7FBUg4u7r9UEbGmkvkc8tbqAd9P0ThlYG6cNuQ6Lnc+7uF1wBukNe2O7uL0hux6dU2XWZLtFgO9uSQ1/rebEtHMnn2CYc+7rcQFhyROe43cwlrT21KAf4WeWQ9oLXAhwdzBVDzRkTBMUlfNFB+xVB1MkD7B3u3ZXR5HCGhzy4nTVc8rHucBccI+IHUk/7JGwvF8k1WHyubHVxSsHNzS0/dRIwScE+ZNG23QE/ZbFjeGunjc5vM6C9yf7Km1uHyMfYMJsbaAo8qfhjVfoaCCkHmj8WYDRzxa3sPuuuziRc69h1T4jIks/ffdE1nBdxF7nfol7OSQ21hcOZ9k3PG5zXgA6jQLv8ALJHwutzJRtjJaOAcV90Cq3U4dPUStu8iwDQ3h2U3Sx+QxkbbEMGi7m0UnxEHtoSuqHCJjZrbcQPqQXSNbxFw0J9zZPtcQbj1ctlI/ueRjgOHuDun2YM9pJ8sk236oNFMJ4i0HQg3I3CPUtAANh1CmW4R6SSHaa2CdbhAabv1a42aNkEgnNdYWaEFPMwvibcsNuRtuggL6CeN5JJ1G6Mn1t53uEEFpk0yVzn2IHX6I5Xlr7AD1DVBBAHGwNI3JO5PNIeNGMBI4rXI3QQSASwxtb5bWgN4SoOqpKeSYB8YNraokEBx1mG0cULXthbxF4br3XH+76ZkUVmbuudeyJBDR+nw6me992aAA2B6p9tND5jwWAgW+qCCROmClhIjPD6nC9+ickjZHHcNB4zYg8tEEEzOiKM2cGNB4eQTraeK/FwC/wAPyQQTZFHCwsdoN+iblij80u4BxBlgexKCCQPNgjLRcbDqgggmH//Z',
    'name': 'Taco',
  }
];
