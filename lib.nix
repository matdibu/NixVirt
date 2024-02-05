pkgs:
let
    objtype = name: getXML:
    {
        inherit getXML;
        writeXML = obj: pkgs.writeTextFile
        {
            name = "NixVirt-"+name+"-" + obj.name;
            text = getXML obj;
        };
    };
in
{
    xml = import generate-xml/xml.nix;
    domain = objtype "domain" (import generate-xml/domain.nix);
}
