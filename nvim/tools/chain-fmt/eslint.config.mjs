import stylistic from "@stylistic/eslint-plugin";
import tsParser from "@typescript-eslint/parser";

const localChainPlugin = {
  rules: {
    "break-first-call-in-chain": {
      meta: {
        type: "layout",
        fixable: "whitespace",
        schema: [],
        messages: {
          breakFirstCall: "Put the first method call in a chain on a new line.",
        },
      },

      create(context) {
        const sourceCode = context.sourceCode;

        function isFirstCallInLongChain(node) {
          if (node.computed) return false;

          const callExpression = node.parent;
          if (
            !callExpression ||
            callExpression.type !== "CallExpression" ||
            callExpression.callee !== node
          ) {
            return false;
          }

          const nextMemberExpression = callExpression.parent;

          return (
            nextMemberExpression &&
            nextMemberExpression.type === "MemberExpression" &&
            nextMemberExpression.object === callExpression
          );
        }

        return {
          MemberExpression(node) {
            if (!isFirstCallInLongChain(node)) return;

            const dotToken = sourceCode.getTokenAfter(
              node.object,
              (token) => token.value === ".",
            );

            if (!dotToken) return;

            const tokenBeforeDot = sourceCode.getTokenBefore(dotToken);

            if (!tokenBeforeDot) return;

            if (tokenBeforeDot.loc.end.line !== dotToken.loc.start.line) {
              return;
            }

            context.report({
              node,
              messageId: "breakFirstCall",

              fix(fixer) {
                return fixer.replaceTextRange(
                  [tokenBeforeDot.range[1], dotToken.range[0]],
                  "\n",
                );
              },
            });
          },
        };
      },
    },
  },
};

export default [
  {
    files: ["**/*.{js,jsx,ts,tsx}"],

    languageOptions: {
      parser: tsParser,
      parserOptions: {
        sourceType: "module",
        ecmaFeatures: {
          jsx: true,
        },
      },
    },

    plugins: {
      "@stylistic": stylistic,
      local: localChainPlugin,
    },

    rules: {
      "local/break-first-call-in-chain": "error",

      "@stylistic/newline-per-chained-call": [
        "error",
        { ignoreChainWithDepth: 1 },
      ],

      "@stylistic/indent": [
        "error",
        2,
        {
          MemberExpression: 1,
        },
      ],
    },
  },
];
