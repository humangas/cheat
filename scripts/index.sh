#!/bin/bash -u
###########################################################################
# Create index.md under _docs folder
# 
# Usage: You can use it in either of the following ways
# $ make index
# $ bash scripts/index.sh
###########################################################################
DOCS_PATH="_docs"
BASE_URL="https://humangas.github.io/cheat"


header() {
cat << EOS
# INDEX
EOS
}

contents() {
    return
}

index() {
    # Contents of variable $l
    # e.g. _docs/shell.md:1:## [shell] あるディレクトリ配下のファイル数をカウントする
    IFS=$'\n'
    for l in $(find $DOCS_PATH -name "*.md" -type f -print0  \
                    | xargs -0 egrep '## \[.*' \
                    | sort); do
        # file=$(echo "$l" | cut -d: -f1)
        # file=$(echo ${file/$DOCS_PATH\//})
        # file=$(echo ${file%.*})
        _tmp=$(echo "$l" | cut -d: -f1 | sed -e "s@$DOCS_PATH/@@")
        file=$(echo ${_tmp%.*})
        
        title=$(echo "$l"  \
            | cut -d: -f2  \
            | sed -e "s/## //"  \
            -e "s/\[.*\] //")
            # -e "s/\[/【/g"  \
            # -e "s/\]/】/g")

        if [[ $file != $header ]]; then
            echo -e "\n### $file"
        fi

        header=$file
        echo "- [$title]($BASE_URL/$file)"
    done
}

main() {
    header > "$DOCS_PATH/index.md"
    contents >> "$DOCS_PATH/index.md" 
    index >> "$DOCS_PATH/index.md"
}

main "$@"
