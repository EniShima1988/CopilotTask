codeunit 50100 "GPT Ideas Proposals"
{
    procedure GenerateIdeas(var InputText: Text) Result: Text
    var
        EventCopilotSetup: Record "Event Copilot Setup";
        Endpoint: Text;
        Deployment: Text;
        SecretKey: Text;
        ErrorText: Text;
        Embedding: List of [Decimal];
        EmbeddingValue: Decimal;
        PreviewValues: Text;
        PreviewCount: Integer;
    begin
        if not AzureOpenAI.IsEnabled(Enum::"Copilot Capability"::"GPT Ideas Copilot") then
            Error('GPT Ideas Copilot is not enabled.');

        EventCopilotSetup.Get();

        Endpoint := (EventCopilotSetup.Endpoint);
        Deployment := EventCopilotSetup.Deployment;
        SecretKey := EventCopilotSetup.UserAPIKey;


        AzureOpenAI.SetCopilotCapability(Enum::"Copilot Capability"::"GPT Ideas Copilot");
        AzureOpenAI.SetAuthorization(Enum::"AOAI Model Type"::Embeddings, Endpoint, Deployment, SecretKey);
        Embedding := AzureOpenAI.GenerateEmbeddings(InputText, AOAIOperationResponse);

        if AOAIOperationResponse.IsSuccess() then begin
            foreach EmbeddingValue in Embedding do begin
                PreviewCount += 1;

                if PreviewValues <> '' then
                    PreviewValues += ', ';

                PreviewValues += Format(EmbeddingValue);

                if PreviewCount = 3 then
                    break;
            end;

            Result := StrSubstNo('Embedding generated successfully. Vector dimensions: %1. First 3 values: [%2]', Embedding.Count(), PreviewValues)
        end
        else begin
            ErrorText := AOAIOperationResponse.GetError();

            Error('Failed to generate embedding: %1', ErrorText);
        end;
    end;

    var
        AzureOpenAI: Codeunit "Azure OpenAI";
        AOAIOperationResponse: Codeunit "AOAI Operation Response";
        IsolatedStorageWrapper: Codeunit "Isolated Storage Wrapper";
}