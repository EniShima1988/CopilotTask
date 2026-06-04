codeunit 50101 "Install Gen. AI Essentials"
{
    Subtype = Install;

    trigger OnInstallAppPerDatabase()
    var
        CopilotCopatibility: Codeunit "Copilot Capability";
        EnvironmentInformation: Codeunit "Environment Information";
        Isolated: Codeunit "Isolated Storage Management";
        LearnMoreUrlTxt: Label 'generative-ai-essentials/tasks/ideas-copilot/', locked = true;
    begin
        if EnvironmentInformation.IsSaaS() then begin
            if not CopilotCopatibility.IsCapabilityRegistered(Enum::"Copilot Capability"::"GPT Ideas Copilot") then
                CopilotCopatibility.RegisterCapability(Enum::"Copilot Capability"::"GPT Ideas Copilot", LearnMoreUrlTxt);
        end;
    end;
}