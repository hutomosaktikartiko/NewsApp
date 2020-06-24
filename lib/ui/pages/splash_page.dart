part of 'pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer timer;

  startTime() {
    return timer = Timer(Duration(seconds: 2), () {
      context.bloc<PageBloc>().add(GoToMainPage());
    });
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            Spacer(),
            Stack(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage("assets/logo.jpg"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment(0, 1),
                          end: Alignment(0, 0.06),
                          colors: [Colors.white, Colors.white.withOpacity(0)])),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Flutter NewApp",
              style: whiteTextFont.copyWith(
                  fontSize: 22,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text("Versi 1.0.0",
                style:
                    whiteTextFont.copyWith(color: Colors.black, fontSize: 15)),
            SizedBox(height: 10)
          ],
        ),
      ),
    ));
  }
}
