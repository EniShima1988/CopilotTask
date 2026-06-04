table 50100 "Event Copilot Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Primary Key';
        }
        field(2; Endpoint; Text[1024])
        {
            DataClassification = CustomerContent;
            Caption = 'Endpoint';
        }
        field(3; Deployment; Text[1024])
        {
            DataClassification = CustomerContent;
            Caption = 'Deployment';
        }
        field(4; UserAPIKey; Text[1024])
        {
            DataClassification = CustomerContent;
            Caption = 'API Key';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;

        }
    }
}