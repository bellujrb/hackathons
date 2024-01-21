export async function cardCreate() {
    try {
        const resposta = await miro.board.createCard({
            title: `
                5.4. Verification and Testing of the PS and SPS
                For verification purposes, the objects of systems use temporal logic (Linear Temporal Logic (LTL) or a logic tree
                computation CTL (Computational Tree Logic) [10, 11].
                The method of deductive analysis LTL provides a logical output according to the model, made by hand. It applies
                only to those facilities that are critical (e.g. security of operation, or the protection of information).
                Verification by model checking is only applicable to objects with a finite number of States. The feature of the
                method of verification for the model is that the verification is conducted automatically and do not need special knowledge
                and time. The method of verification- mathematical formulation of requirements to create programs with help algorithms
                of formal verification requirements.
                Testing work products (plans, test suites, test data) is based on the use of CRU and finished products. Test
                products should be suitable for other PP and are part of the reusable components of a family of FPS. For testing the PS and
                FPS requirements use scenarios (Scenario-based test derivation), the method of analysis of trees FCTA (Fault Contribution
                Tree Analysis) and complex PLUTO (Product Lines Use case Test Optimization).
            `,
        });
        console.log('Cartão criado com sucesso:', resposta);
        return resposta;
    } catch (erro) {
        console.error('Erro ao criar cartão no Miro:', erro);
        throw erro;
    }
}
