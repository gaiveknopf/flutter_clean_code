import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';
import '../../helpers/helpers.dart';
import './components/components.dart';

import '../../mixins/mixins.dart';
import './surveys.dart';

class SurveysPage extends StatefulWidget {
  final SurveysPresenter presenter;

  SurveysPage(this.presenter);

  @override
  _SurveysPageState createState() => _SurveysPageState();
}

class _SurveysPageState extends State<SurveysPage>
    with LoadingManager, NavegationManager, SessionManager, RouteAware {
  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    Get.find<RouteObserver>().subscribe(this, ModalRoute.of(context));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          R.strings.surveys,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await storage.deleteAll();
            },
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          widget.presenter.loadData();

          handleLoading(context, widget.presenter.isLoadingStream);
          handleSessionExpired(widget.presenter.isSessionExpiredStream);
          handleNavigation(widget.presenter.navigateToStream);

          return StreamBuilder<List<SurveyViewModel>>(
              stream: widget.presenter.surveysStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return ReloadScreen(
                    error: snapshot.error,
                    reload: widget.presenter.loadData,
                  );
                }
                if (snapshot.hasData) {
                  return Provider(
                    create: (_) => widget.presenter,
                    child: SurveyItems(snapshot.data),
                  );
                }
                return SizedBox(height: 0);
              });
        },
      ),
    );
  }

  @override
  void didPopNext() {
    widget.presenter.loadData();
    super.didPopNext();
  }

  @override
  void dispose() {
    Get.find<RouteObserver>().unsubscribe(this);
    super.dispose();
  }
}
