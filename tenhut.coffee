terminalHtml = '<section class="terminal col-md-12">
                    <div class="command">
                        <input type="text" class="form-control">
                        <span class="add-command">Add Command</span>
                        <span class="delete-command">Delete</span>
                    </div>
                    <div class="control">
                        <span class="add-terminal">Add Terminal</span>
                        <span class="delete-terminal">Delete</span>
                    </div>
                </section>'

commandHtml = '<div class="command">
                <input type="text" class="form-control">
                <span class="add-command">Add Command</span>
                <span class="delete-command">Delete</span>
               </div>'

# Add terminal
$(".terminal-container").delegate ".add-terminal", "click", ->
    $(this).parent().parent().parent().append terminalHtml

# Delete terminal
$(".terminal-container").delegate ".delete-terminal", "click", ->
    $(this).parent().parent().remove();

# Add command
$(".terminal-container").delegate ".add-command", "click", ->
    $(commandHtml).insertBefore($(this).parent().parent().find(".control"))

# Delete command
$(".terminal-container").delegate ".delete-command", "click", ->
    $(this).parent().remove();

# Generate
$(document).delegate "input", "keyup", ->
    singleTerminal = "<p>#!/bin/bash</p>"
    $(".terminal").each ->
        singleTerminal += "<p>osascript -e 'tell application \"Terminal\" to do script \""
        commandChildren = $(this).children(".command")
        commandChildren.each (index) ->
            singleTerminal += $(this).find("input").val()
            singleTerminal += " && " if index != commandChildren.length - 1
        singleTerminal += "\"'</p>"
    $("#result").empty()
    $("#result").append(singleTerminal)