page 50101 "Ideas Proposal"
{
    Caption = 'Ideas Proposal';
    PageType = PromptDialog;
    Extensible = false;
    IsPreview = true;
    // SourceTable = Customer;
    // SourcetableTemporary = true;
    UsageCategory = Administration;


    layout
    {
        area(Prompt)
        {
            field(InputText; InputText)
            {
                Multiline = true;
                ShowCaption = false;
                ApplicationArea = All;
            }
        }
        area(Content)
        {
            field(ResponseText; ResponseText)
            {
                Multiline = true;
                ShowCaption = false;
                ApplicationArea = All;
                Editable = false;
            }
        }

        area(PromptOptions)
        {
            field(Tone; Tone)
            {
                Caption = 'Tone';
                ApplicationArea = All;
                ToolTip = 'Specify the style of generated text';
            }
            field(TextFormat; TextFormat)
            {
                Caption = 'Text Format';
                ApplicationArea = All;
                ToolTip = 'Specify the length format of generated text';
            }
            field(Emphasis; Emphasis)
            {
                Caption = 'Emphasis';
                ApplicationArea = All;
                ToolTip = 'Specify the quality to emphasize in the generated text';
            }
        }


    }

    actions
    {
        area(SystemActions)
        {
            systemaction(Generate)
            {
                Caption = 'Generate';
                trigger OnAction()
                var
                    GenerateIdeas: Codeunit "GPT Ideas Proposals";
                begin
                    ResponseText := 'This is a response from the Generative AI Copilot based on the input: ' + GenerateIdeas.GenerateIdeas(InputText);
                end;
            }

            systemaction(Ok)
            {
                Caption = 'Ok';
            }
            systemaction(Cancel)
            {
                Caption = 'Cancel';
            }
        }
    }

    var
        InputText: Text;
        ResponseText: Text;
        Tone: Enum "Entity Text Tone";
        TextFormat: Enum "Entity Text Format";
        Emphasis: Enum "Entity Text Emphasis";
}