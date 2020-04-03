<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>Expiration Notification</fullName>
        <active>true</active>
        <criteriaItems>
            <field>ActiveScratchOrg.ExpirationDate__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Active Scratch Org Expiration</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Scratch_Org_Expiration</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>ActiveScratchOrg.ExpirationDate__c</offsetFromField>
            <timeLength>-3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
