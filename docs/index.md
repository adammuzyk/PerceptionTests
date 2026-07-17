# PerceptionTests

PerceptionTests is a configurable Windows application for auditory stream-segregation experiments. It generates listening stimuli at runtime, presents participant questionnaires, records behavioural responses, and exports structured JSON results.

## Start here

<div class="grid cards" markdown>

-   :material-download: **Run the application**

    Download a self-contained Windows release. Visual Studio and the .NET SDK are not required.

    [Quick start](QUICK_START.md)

-   :material-tune: **Prepare a study**

    Review playback-chain calibration and researcher-editable configuration before participant testing.

    [Calibration](CALIBRATION.md) · [Configuration](RESEARCHER_CONFIG_GUIDE.md)

-   :material-database-export: **Work with results**

    Read the output schema, checkpoint behaviour, and downstream analysis notes.

    [Output schema](OUTPUT_SCHEMA.md) · [Data analysis](DATA_ANALYSIS.md)

-   :material-code-braces: **Build from source**

    Developer requirements and build commands are documented separately from the end-user workflow.

    [Dependencies and source build](DEPENDENCIES.md)

</div>

## Documentation principles

The documentation separates two use cases:

1. **Researchers and participants** download and run a precompiled Windows package.
2. **Developers** build, test, modify, and package the source code.

Every substantive change to an experiment or questionnaire configuration should be treated as a study-protocol change and archived with the collected data.
