
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reusable_widgets_h_v_scroll/src/pages/page_one.dart';


class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // El Scaffold esta envuelto en el ChangeNotifierProvider para poder mandar y escuchar info
    // a todos sus hijos
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );

  }

}

class _Navigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavigationModel>(context);

    final color = Color.fromRGBO(167, 192, 205, 1);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (value) => navegacionModel.paginaActual = value,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, color: color,), 
          title: Text('Account')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today , color: color,), 
          title: Text('Bookings')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message, color: color,),
          title: Text('Messages')
        ),
      ]
    );
  }

}

class _Pages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      // physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        PageOne()
      ],
    );

  }

}

/**
 * Esta clase es la encargada de gestionar la navegación de nuestro bottom nav bar
 * es como un patron Bloc pero más limpio.
 */

class _NavigationModel with ChangeNotifier {

  int _paginaActual = 0;
  PageController _pageController = new PageController(initialPage: 0);

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;
    
    // Cambia de página
    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeOut);

    notifyListeners();
  }

  PageController get pageController => this._pageController;

}

