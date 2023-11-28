import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const ListGridSelection(),
  ));
}

class ListGridSelection extends StatefulWidget {
  const ListGridSelection({super.key});

  @override
  State<ListGridSelection> createState() => _ListGridSelectionState();
}

class _ListGridSelectionState extends State<ListGridSelection> {
  bool _isGridDisplay = false;
  bool _isSelectionMode = false;
  late List<bool> _list;

  @override
  void initState() {
    _list = List.generate(20, (index) => false);
    super.initState();
  }

  @override
  void dispose() {
    _list.clear();
    super.dispose();
  }

  void _onChangeSelectionMode(bool value) {
    setState(() {
      _isSelectionMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        leading: _isSelectionMode
            ? IconButton(
                onPressed: () {
                  _onChangeSelectionMode(false);
                },
                icon: const Icon(Icons.close))
            : const SizedBox(),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _isGridDisplay = !_isGridDisplay;
                });
              },
              icon: Icon(_isGridDisplay ? Icons.list : Icons.grid_on))
        ],
      ),
      body: _isGridDisplay
          ? GridViewBuilder(
              list: _list,
              isSelectionMode: _isSelectionMode,
              onChangeSelectionMode: _onChangeSelectionMode,
            )
          : ListViewBuilder(
              list: _list,
              isSelectionMode: _isSelectionMode,
              onChangeSelectionMode: _onChangeSelectionMode,
            ),
    );
  }
}

class GridViewBuilder extends StatefulWidget {
  final List<bool> list;
  final bool isSelectionMode;
  final Function(bool) onChangeSelectionMode;
  const GridViewBuilder(
      {super.key,
      required this.list,
      required this.isSelectionMode,
      required this.onChangeSelectionMode});

  @override
  State<GridViewBuilder> createState() => _GridViewBuilderState();
}

class _GridViewBuilderState extends State<GridViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return InkWell(
          onLongPress: () {
            if (!widget.isSelectionMode) {
              widget.onChangeSelectionMode(true);
            }
          },
          child: GridTile(
            
              child: widget.isSelectionMode
                  ? Checkbox(
                      value: widget.list[index],
                      onChanged: (value) {
                        setState(() {
                          widget.list[index] = value ?? false;
                        });
                      })
                  : const Icon(Icons.abc)),
        );
      },
    );
  }
}

class ListViewBuilder extends StatefulWidget {
  final List<bool> list;
  final bool isSelectionMode;
  final Function(bool) onChangeSelectionMode;
  const ListViewBuilder(
      {super.key,
      required this.list,
      required this.isSelectionMode,
      required this.onChangeSelectionMode});

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, index) => ListTile(
        title: Text('Data $index'),
        trailing: widget.isSelectionMode
            ? Checkbox(
                value: widget.list[index],
                onChanged: (value) => setState(() {
                  widget.list[index] = value ?? true;
                }),
              )
            : const SizedBox(),
        onTap: () {
          if (widget.isSelectionMode) {
            setState(() {
              widget.list[index] = !widget.list[index];
            });
          }
        },
        onLongPress: () {
          if (!widget.isSelectionMode) {
            widget.onChangeSelectionMode(true);
          }
        },
      ),
    );
  }
}
