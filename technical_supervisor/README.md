# Technical supervisor UMLs

Here you will find the diagrams used to describe the technical supervisor system.

## PlantUML setup

Setup based on https://plantuml.com/en-dark/starting.

After trying the online version, if you're considering a more comprehensive local environment, a local installation of PlantUML is suggested. Before installation, ensure the following prerequisites are met:

### Java: PlantUML requires Java to be installed on your machine.

Check if Java is already installed: `java -version`. The minimum version needed is Java 8.

If not installed, download and install it from the official Java website or through package managers like apt for Ubuntu, brew for macOS, etc.

### GraphViz: Needed only for some diagrams.

Linux: You'll find mode information here about GraphViz installation
Windows: A compiled version of GraphViz is embedded within PlantUML, eliminating the need for a separate installation. However, if needed, you can acquire a standalone version [here](https://plantuml.com/en-dark/graphviz-dot).

Once ready, download the plantuml.jar file and execute it to access PlantUML’s graphical user interface. No further unpacking or installation procedures are needed.


## Database Markup Language

From [dbdiagram.io](https://dbml.dbdiagram.io/home): 
> DBML (Database Markup Language) is an open-source DSL language 
> designed to define and document database schemas and structures.

Our database diagram can be visualized [online](https://dbdiagram.io/home) or via our custom [dbml-to-sql parser](dbml-parser/README.md).