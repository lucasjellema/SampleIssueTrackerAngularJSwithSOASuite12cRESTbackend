xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://TargetNamespace.com/IssueTrackerAppRestService_retrieveIssues_response";
(:: import schema at "Resources/nxsd_Issues_json.xsd" ::)
declare namespace ns1="nl.amis/workflow";
(:: import schema at "XMLSchema_-589990623.xsd" ::)

declare variable $issues as element() (:: schema-element(ns1:IssueList) ::) external;

declare function local:func($issues as element() (:: schema-element(ns1:IssueList) ::)) as element() (:: schema-element(ns2:issues) ::) {
    <ns2:issues>
        {
        let $orderby := ('Identifier ascending')
            for $Issue in $issues/ns1:Issue 
            order by 
            if ($orderby[1]='Identifier descending') then fn:number($Issue/ns1:Identifier) else() descending,
            if ($orderby[1]='Identifier ascending') then fn:number($Issue/ns1:Identifier) else() ascending
            return 
            <ns2:topLevelArray>
                <ns2:number>{fn:data($Issue/ns1:Identifier)}</ns2:number>
                <ns2:title>{fn:data($Issue/ns1:Title)}</ns2:title>
                <ns2:user><ns2:login>{fn:data($Issue/ns1:Reporter)}</ns2:login></ns2:user>
                <ns2:state>{fn:data($Issue/ns1:Status)}</ns2:state>
                <ns2:body>{fn:data($Issue/ns1:Description)}</ns2:body>
                <ns2:created_at>{fn:data($Issue/ns1:DateOfOriginalReport)}</ns2:created_at>
                <ns2:updated_at>{fn:data($Issue/ns1:DateOfLatestUpdate)}</ns2:updated_at>
                <ns2:comments>{fn:string-length(fn:data($Issue/ns1:Comments))}</ns2:comments></ns2:topLevelArray>
        }</ns2:issues>
};

local:func($issues)
