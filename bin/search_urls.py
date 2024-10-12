import argparse, re
import urllib.parse


def main():
    parser = argparse.ArgumentParser(description='Expand a search URL with multiple queries.')
    parser.add_argument('--search-urls', '-s', action='append', required=True, help='List of search URLs with a placeholder "%s".')
    parser.add_argument('queries', nargs='+', help='List of queries to replace the placeholder with.')

    args = parser.parse_intermixed_args()
    # print(args)

    for query in args.queries:
        for search_url in args.search_urls:
            words = re.split(r'\b', query)
            # print("words", words)
            words = [word for word in words if word]
            encoded_query = urllib.parse.quote(' '.join(words))

            expanded_url = search_url.replace("%s", encoded_query)
            print(expanded_url)

if __name__ == "__main__":
    main()
