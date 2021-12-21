import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

import 'empty_page.dart';

class AdvanceListView<T> extends StatefulWidget {
  final List<T> items;
  final String emptyPageTitle;
  final Axis scrollDirection;
  final Future<void> Function()? onLoadMoreData;
  final Future<void> Function() onRefreshData;
  final Widget Function(BuildContext, T,int) itemBuilder;
  final bool hasMoreData;
  final bool shrinkWrap;

   const AdvanceListView({
    required final this.itemBuilder,
    required final this.onRefreshData,
    required final this.emptyPageTitle,
    final this.items = const [],
    final this.onLoadMoreData,
    final this.hasMoreData = false,
    final this.shrinkWrap = false,
     final this.scrollDirection=Axis.vertical,
    final Key? key,
  }) : super(key: key);

  @override
  AdvanceListViewState<T> createState() => AdvanceListViewState<T>();
}

class AdvanceListViewState<T> extends State<AdvanceListView<T>> {
   int animationDuration = 400;
  final GlobalKey<AnimatedListState> listKey = GlobalKey();
  bool _isLoading = false;
  bool get _hasMoreData => widget.hasMoreData;
  bool get _isLoadingData => _isLoading;
  bool get _isEmpty => !widget.hasMoreData && widget.items.isEmpty;
  bool _canRefresh = true;
  late VoidCallback _scrollListener;
  final Debouncer _debouncer =
  Debouncer(delay: const Duration(milliseconds: 500));

  ScrollController get _effectiveScrollController =>ScrollController();

  @override
  Widget build(final BuildContext context) =>
      RefreshIndicator( onRefresh: _onRefresh, child: Stack(
        children: [
          _listviewWidget,
          if (_isEmpty) EmptyPage(title: widget.emptyPageTitle,),
        ],
      ));

  Widget get _listviewWidget {
    final Widget result = AnimatedList(
     key: listKey,
     controller: _effectiveScrollController,
      scrollDirection: widget.scrollDirection,
     //  padding: _padding,
     //  physics: widget.physics,
     //  reverse: widget.reverse,
     //  primary: widget.primary,
      initialItemCount: widget.items.length,
      shrinkWrap: widget.shrinkWrap ,
      itemBuilder: _lisItemBuilder,
    );
    // if (!widget.disableScrollbar) {
    //   result = CupertinoScrollbar(
    //     controller: _effectiveScrollController,
    //     thickness: widget.scrollbarThickness,
    //     radius: widget.scrollbarRadius,
    //     isAlwaysShown: widget.scrollbarIsAlwaysShown,
    //     child: result,
    //   );
    // }
    return Stack(
      children: [
        result,
        if (_hasMoreData && widget.items.isEmpty) _loadingOrErrorWidget,
      ],
    );
  }

  Widget _lisItemBuilder(
      final BuildContext context,
      final int index,
      final Animation<double> animation,
      ) =>
      _axisWidget(
        children: [
          _itemContainer(
            context,
            index,
            animation,
          ),
          if (_hasMoreData && index == widget.items.length - 1)
            _loadingOrErrorWidget,
        ],
      );

  Widget get _loadingOrErrorWidget =>
         _loadingWidget;

  Widget get _loadingWidget =>
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: CircularProgressIndicator(),
            ),
          );

  Widget _axisWidget({required final List<Widget> children}) =>
     widget.scrollDirection == Axis.vertical
           ?
    Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ) : Row(
       mainAxisSize: MainAxisSize.min,
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: children,
     );

  Widget _itemContainer(
      final BuildContext context,
      final int index,
      final Animation<double> animation,
      ) =>
      FadeTransition(
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
          child: widget.itemBuilder(
            context,
             widget.items[index],
            index,
          ),
        ),
      );
  Future<void> _onRefresh() async {
    if (!_canRefresh) {
      return;
    }
    _canRefresh = false;
    await widget.onRefreshData.call();
    _canRefresh = true;
  }
  Future<void> _callLoadMoreData() async {
    _isLoading = true;
    return widget.onLoadMoreData?.call().whenComplete(() {
      _isLoading = false;
    });
  }
  @override
  void didUpdateWidget(covariant final AdvanceListView<T> oldWidget) {
    // if (oldWidget.scrollController != widget.scrollController) {
    //   if (oldWidget.scrollController != null &&
    //       widget.scrollController == null) {
    //     oldWidget.scrollController?.removeListener(_scrollListener);
    //   }
    //   _effectiveScrollController.addListener(_scrollListener);
    // }
    WidgetsBinding.instance!.addPostFrameCallback((final _) {
      if (widget.items.isNotEmpty) {
        _checkLoadMoreData();
      }
      _maybeTriggerScrollbar();
    });
    super.didUpdateWidget(oldWidget);
  }
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((final _) {
      _maybeTriggerScrollbar();
    });
    super.didChangeDependencies();
  }
  void _maybeTriggerScrollbar() {
    if (_effectiveScrollController.hasClients) {
      _effectiveScrollController.position.notifyListeners();
    }
  }
  @override
  void initState() {
    _scrollListener = () async {
      if (_hasMoreData &&
          !_isLoadingData &&
          widget.items.isNotEmpty ) {
        await _callLoadMoreData();
      }
    };
     _effectiveScrollController.addListener(_scrollListener);
    super.initState();
  }
  @override
  void dispose() {
    _debouncer.cancel();
    _effectiveScrollController.removeListener(_scrollListener);
    // _scrollController?.dispose();
    super.dispose();
  }
  @override
  void setState(final VoidCallback fn) {
    _checkLoadMoreData();
    _maybeTriggerScrollbar();
    super.setState(fn);
  }

  void _checkLoadMoreData() {
    Future.delayed(const Duration(milliseconds: 500), () async {
      if (_hasMoreData &&
          !_isLoadingData &&
          widget.items.isNotEmpty &&
          _effectiveScrollController.position.maxScrollExtent == 0) {
        await _callLoadMoreData();
      }
    });
  }

  void addAll(final List<T> items, {final bool withAnimation = true}) {
    for (final T item in items) {
      addItem(item, withAnimation: withAnimation);
    }
  }

  void addItem(
      final T item, {
        final int? atIndex,
        final bool withAnimation = true,
      }) {
    listKey.currentState!.insertItem(
      atIndex??0,
      duration: withAnimation
          ? Duration(milliseconds: animationDuration)
          : Duration.zero,
    );

    widget.items.insert(atIndex ?? widget.items.length, item);
    setState(() {});
  }
   void clearAllItems() {
     for (var i = 0; i <= widget.items.length - 1; i++) {
       listKey.currentState
           !.removeItem(0, (final context, final animation) => const SizedBox());
     }
     widget.items.clear();
   }

}
