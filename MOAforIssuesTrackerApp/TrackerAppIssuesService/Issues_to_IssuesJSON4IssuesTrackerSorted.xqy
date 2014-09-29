xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns3="http://TargetNamespace.com/IssueTrackerAppRestService_retrieveIssues_response";
(:: import schema at "Resources/nxsd_Issues_json.xsd" ::)
declare namespace ns2="http://TargetNamespace.com/IssuesRestService_Operation1_request";
(:: import schema at "Resources/nxsd_issues_request.xsd" ::)
declare namespace ns1="nl.amis/workflow";
(:: import schema at "XMLSchema_-589990623.xsd" ::)

declare variable $canonicalIssues as element() (:: schema-element(ns1:IssueList) ::) external;
declare variable $sortBy as xs:string external;
declare variable $direction as xs:string external;

declare function local:func($sortBy as xs:string
                           ,$direction as xs:string
                           ,$canonicalIssues as element() (:: schema-element(ns1:IssueList) ::)
                            ) 
                            as element() (:: schema-element(ns3:issues) ::) {
       <ns2:issues>
        {
   
            for $Issue in $canonicalIssues/ns1:Issue
            order by 
            if ($sortBy='identifier' and $direction='asc') then fn:number($Issue/ns1:Identifier) else() ascending,
            if ($sortBy='identifier' and $direction='desc') then fn:number($Issue/ns1:Identifier) else() descending,
            if ($sortBy='created' and $direction='asc') then $Issue/ns1:DateOfOriginalReport else() ascending,
            if ($sortBy='created' and $direction='desc') then $Issue/ns1:DateOfOriginalReport else() descending,
            if ($sortBy='updated' and $direction='asc') then $Issue/ns1:DateOfLatestUpdate else() ascending,
            if ($sortBy='updated' and $direction='desc') then $Issue/ns1:DateOfLatestUpdate else() descending,
            if ($sortBy='comments' and $direction='asc') then fn:string-length(fn:data($Issue/ns1:Comments)) else() ascending,
            if ($sortBy='comments' and $direction='desc') then fn:string-length(fn:data($Issue/ns1:Comments)) else() descending
            return 
            <ns2:topLevelArray>
                <ns2:number>{fn:data($Issue/ns1:Identifier)}</ns2:number>
                <ns2:title>{fn:data($Issue/ns1:Title)}{fn:data($sortBy)}</ns2:title>
                <ns2:user><ns2:login>{fn:data($Issue/ns1:Reporter)}</ns2:login></ns2:user>
                <ns2:state>{fn:data($Issue/ns1:Status)}</ns2:state>
                <ns2:body>{fn:data($Issue/ns1:Description)}</ns2:body>
                <ns2:created_at>{fn:data($Issue/ns1:DateOfOriginalReport)}</ns2:created_at>
                <ns2:updated_at>{fn:data($Issue/ns1:DateOfLatestUpdate)}</ns2:updated_at>
                <ns2:comments>{fn:string-length(fn:data($Issue/ns1:Comments))}</ns2:comments></ns2:topLevelArray>
        }</ns2:issues>

};

local:func( $sortBy,$direction, $canonicalIssues)
