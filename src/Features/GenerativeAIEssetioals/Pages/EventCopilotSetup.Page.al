page 50100 "Event Copilot Setup"
{
    PageType = Card;
    ApplicationArea = All;
    Caption = 'Event Copilot Setup';
    UsageCategory = Administration;
    SourceTable = "Event Copilot Setup";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(Endpoint; Rec.Endpoint)
                {
                    ToolTip = 'Specifies the value of the Endpoint field.', Comment = '%';
                }
                field(Deployment; Rec.Deployment)
                {
                    ToolTip = 'Specifies the value of the Deployment field.', Comment = '%';
                }
                field(UserAPIKey; Rec.UserAPIKey)
                {
                    ToolTip = 'Specifies the value of the API Key field.', Comment = '%';
                    MaskType = Concealed;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("GPT Ideas")
            {
                Caption = 'Event Ideas';
                ToolTip = 'Generate event ideas using GPT.';
                Image = Sparkle;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Page.RunModal(Page::"Ideas Proposal")
                end;
            }
        }
    }

    trigger OnInit()
    var
        myInt: Integer;
    begin
        if Not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
